#include "Backend.h"
#include <qcolor.h>
#include <qvariant.h>
#include <random>
#include <QTimer>
#include <math.h>
#include <thread>
#include <sstream>
#include <qthread.h>
#include <QtCore/qcoreapplication.h>

Backend::Backend() {
	HANDLE file = CreateFileW(
		L"settings.txt",
		GENERIC_READ,
		FILE_SHARE_READ,
		NULL,
		OPEN_EXISTING,
		FILE_ATTRIBUTE_NORMAL,
		NULL
	);
	if (file != INVALID_HANDLE_VALUE) {
		DWORD fileSize = GetFileSize(file, NULL);
		is_settings_file_created = true;
		string buff;
		buff.resize(fileSize);

		DWORD bytesRead;
		ReadFile(file, buff.data(), fileSize, &bytesRead, NULL);


		int i = 0;
		int j = 0;


		std::stringstream ss(buff);
		QList<int> temp;

		int value;
		while (ss >> value) {
			temp.push_back(value);
		}


		number_of_sequences = temp[0];
		number_of_digits = temp[1];
		time_to_remember = temp[2];
		time_to_answer = temp[3];
		time_to_check_the_answer = temp[4];
		best_digits = temp[5];
		avg_accuracy_last_session = temp[6];
	}
	else {

		is_settings_file_created = false;
	}

	CloseHandle(file);

}


void Backend::setRoot(QObject* root)
{
	m_root = root;

	beginning_timer = m_root->findChild<QObject*>("beginning_timer");
	sequence_text = m_root->findChild<QObject*>("sequence_text");
	examples_text = m_root->findChild<QObject*>("examples_text");
	userinput = m_root->findChild<QObject*>("userinput");
	accuracy_percent = m_root->findChild<QObject*>("accuracy_percent");
	accuracy_text = m_root->findChild<QObject*>("accuracy_text");
	progress_bar_animation = m_root->findChild<QObject*>("progress_bar_animation");
	progress_bar = m_root->findChild<QObject*>("progress_bar");
	progress_bar_rectangle = m_root->findChild<QObject*>("progress_bar_rectangle");
	accuracy_background = m_root->findChild<QObject*>("accuracy_background");
	sequence_background = m_root->findChild<QObject*>("sequence_background");
	best_digits_text = m_root->findChild<QObject*>("best_digits_text");
	best_digits_text->setProperty("text", best_digits);
	avg_accuracy_last_session_text = m_root->findChild<QObject*>("avg_accuracy_last_session_text");
	avg_accuracy_last_session_text->setProperty("text", QString::number(avg_accuracy_last_session) + "%");
	qDebug() << avg_accuracy_last_session;
	number_of_sequences_text = m_root->findChild<QObject*>("button_text_number_of_sequences");
	number_of_digits_text = m_root->findChild<QObject*>("button_text_number_of_digits");
	time_to_remember_text = m_root->findChild<QObject*>("button_text_time_to_remember");
	time_to_answer_text = m_root->findChild<QObject*>("button_text_time_to_answer");
	time_to_check_the_answer_text = m_root->findChild<QObject*>("button_text_time_to_check_the_answer");

	if (is_settings_file_created) {
		number_of_sequences_text->setProperty("text", number_of_sequences);
		number_of_digits_text->setProperty("text", number_of_digits);
		time_to_remember_text->setProperty("text", time_to_remember);
		time_to_answer_text->setProperty("text", time_to_answer);
		time_to_check_the_answer_text->setProperty("text", time_to_check_the_answer);
	}
	else {
		number_of_sequences_text->setProperty("text", "Select");
		number_of_digits_text->setProperty("text", "Select");
		time_to_remember_text->setProperty("text", "Select");
		time_to_answer_text->setProperty("text", "Select");
		time_to_check_the_answer_text->setProperty("text", "Select");
	}

	srand(time(NULL));
}

Q_INVOKABLE void Backend::start_beginning_timer()
{

	

	beginning_timer->setProperty("visible", true);
	progress_bar_rectangle->setProperty("visible", false);
	auto delay1 = [&](int ms) {
		QEventLoop loop;
		QTimer::singleShot(ms, &loop, &QEventLoop::quit);
		loop.exec();
		};
	beginning_timer->setProperty("text", QString::number(3));
	delay1(1000);
	beginning_timer->setProperty("text", QString::number(2));
	delay1(1000);
	beginning_timer->setProperty("text", QString::number(1));
	delay1(1000);
	beginning_timer->setProperty("visible", false);
	progress_bar_rectangle->setProperty("visible", true);
	begin_session();
}

void Backend::begin_session()
{
	avg_accuracy_last_session = 0;
	auto delay = [&](int ms) {
		QEventLoop loop;
		QTimer::singleShot(ms, &loop, &QEventLoop::quit);
		loop.exec();
		};

	sequence_text->setProperty("visible", true);
	sequence_background->setProperty("visible", true);
	QString sequence;
	for (int i = 0; i < number_of_sequences; i++)
	{
		sequence.clear();

		for (int j = 0; j < number_of_digits; j++) 
		{
			sequence += QString::number(rand() % 10);
		}

		sequence_text->setProperty("text", sequence);
		sequence_background->setProperty("visible", true);

		progress_bar_animation->setProperty("from", 100);
		progress_bar_animation->setProperty("to", 0);
		progress_bar_animation->setProperty("duration", time_to_remember * 1000);
		QMetaObject::invokeMethod(progress_bar_animation, "stop");
		QMetaObject::invokeMethod(progress_bar_animation, "start");
		delay(time_to_remember * 1000);

		sequence_text->setProperty("visible", false);
		sequence_background->setProperty("visible", false);
		userinput->setProperty("visible", true);
		userinput->setProperty("focus", true);
		userinput->setProperty("text", "");

		progress_bar_animation->setProperty("from", 100);
		progress_bar_animation->setProperty("to", 0);
		progress_bar_animation->setProperty("duration", time_to_answer * 1000);
		QMetaObject::invokeMethod(progress_bar_animation, "stop");
		QMetaObject::invokeMethod(progress_bar_animation, "start");
		delay(time_to_answer * 1000);


		QString answer = userinput->property("text").toString();

		float percent_of_one_digit = (1.0 / sequence.length()) * 100;

		float accuracy = 100;

		QString highlight;
		for (int j = 0; j < number_of_digits; j++) {
			if (answer[j] == sequence[j]) {
				highlight += QString("<span style='color:#3FF527;'>") + sequence[j] + QString("</span>");
			}
			else {
				highlight += QString("<span style='color:red;text-decoration: underline;'>") + sequence[j] + QString("</span>");
				accuracy -= percent_of_one_digit;
			}
		}
		if (number_of_digits > best_digits and accuracy == 100) {
			best_digits = number_of_digits;
		}
		
		sequence_text->setProperty("visible", true);
		sequence_text->setProperty("text", highlight);
		accuracy_percent->setProperty("text", QString::number(round(accuracy)) + QString("%"));
		accuracy_background->setProperty("visible", true);

		progress_bar_animation->setProperty("from", 100);
		progress_bar_animation->setProperty("to", 0);
		progress_bar_animation->setProperty("duration", time_to_check_the_answer * 1000);
		QMetaObject::invokeMethod(progress_bar_animation, "stop");
		QMetaObject::invokeMethod(progress_bar_animation, "start");
		delay(time_to_check_the_answer * 1000);



		userinput->setProperty("visible", false);
		accuracy_background->setProperty("visible", false);
		avg_accuracy_last_session += accuracy;

	}
	examples_text->setProperty("visible", false);
	sequence_text->setProperty("visible", false);
	best_digits_text->setProperty("text", best_digits);
	avg_accuracy_last_session /= number_of_sequences;
	avg_accuracy_last_session_text->setProperty("text", QString::number(avg_accuracy_last_session) + "%");
}

Q_INVOKABLE void Backend::set_time_to_remember(int number)
{
	time_to_remember = number;
}

Q_INVOKABLE void Backend::set_number_of_digits(int number)
{
	number_of_digits = number;
}

Q_INVOKABLE void Backend::set_number_of_sequences(int number)
{
	number_of_sequences = number;
}

Q_INVOKABLE void Backend::set_time_to_answer(int number)
{
	time_to_answer = number;
}

Q_INVOKABLE void Backend::set_time_to_check_answer(int number)
{
	time_to_check_the_answer = number;
}


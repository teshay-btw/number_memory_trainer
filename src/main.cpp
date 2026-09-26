#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Backend.h"
#include <QQmlContext>
#include <qicon.h>


int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN) && QT_VERSION_CHECK(5, 6, 0) <= QT_VERSION && QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    //app.setWindowIcon(QIcon(":/qt/qml/infinite_math_test/icon.png"));
    QQmlApplicationEngine engine;

    Backend backend;
    app.setWindowIcon(QIcon(":/qt/qml/numbers_memorisation/brain_icon.png"));
    engine.rootContext()->setContextProperty("backend", &backend);

    //////////////
    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/numbers_memorisation/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;
    ///////////////


    QObject* root = engine.rootObjects().first(); 
    backend.setRoot(root); 

    QObject::connect(qApp, &QCoreApplication::aboutToQuit, [&backend]() {
        if (backend.number_of_digits != 0 and backend.number_of_sequences != 0 and backend.time_to_answer != 0 and backend.time_to_remember != 0 and backend.time_to_check_the_answer != 0) {
            HANDLE save_game_file = CreateFileW(
                L"settings.txt",
                GENERIC_READ | GENERIC_WRITE,
                FILE_SHARE_READ | FILE_SHARE_WRITE,
                NULL,
                OPEN_ALWAYS,
                FILE_ATTRIBUTE_NORMAL,
                NULL
            );
            DWORD bytesWritten;
            string buffer;

            buffer += std::to_string(backend.number_of_sequences);
            buffer += "\n";
            buffer += std::to_string(backend.number_of_digits);
            buffer += "\n";
            buffer += std::to_string(backend.time_to_remember);
            buffer += "\n";
            buffer += std::to_string(backend.time_to_answer);
            buffer += "\n";
            buffer += std::to_string(backend.time_to_check_the_answer);
            buffer += "\n";
            buffer += std::to_string(backend.best_digits);
            buffer += "\n";
            buffer += std::to_string(backend.avg_accuracy_last_session);
            buffer += "\n";

            WriteFile(save_game_file, buffer.c_str(), buffer.size(), &bytesWritten, NULL);
            CloseHandle(save_game_file);
        }
        });



    return app.exec();
}

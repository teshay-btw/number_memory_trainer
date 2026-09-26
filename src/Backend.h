#pragma once
#include <QObject>
#include <QString>
#include <vector>
#include <Windows.h>
#include <QTimer>
#include <thread>
using namespace std;

class Backend :
    public QObject
{
    Q_OBJECT
public:
    Backend();
    void setRoot(QObject* root);
    Q_INVOKABLE void start_beginning_timer();
    void begin_session();
    Q_INVOKABLE void set_time_to_remember(int number);
    Q_INVOKABLE void set_number_of_digits(int number);
    Q_INVOKABLE void set_number_of_sequences(int number);
    Q_INVOKABLE void set_time_to_answer(int number);
    Q_INVOKABLE void set_time_to_check_answer(int number);




    int time_to_remember;
    int number_of_digits;
    int number_of_sequences;
    int time_to_answer;
    int time_to_check_the_answer;

    int avg_accuracy_last_session = 0;
    int best_digits = 0;

private:
    QObject* m_root = nullptr;
    QObject* beginning_timer = nullptr;
    QObject* sequence_text = nullptr;
    QObject* examples_text = nullptr;
    QObject* userinput = nullptr;
    QObject* accuracy_percent = nullptr;
    QObject* accuracy_text = nullptr;
    QObject* progress_bar_animation = nullptr;
    QObject* progress_bar = nullptr;
    QObject* progress_bar_rectangle = nullptr;
    QObject* accuracy_background = nullptr;
    QObject* sequence_background = nullptr;
    QObject* best_digits_text = nullptr;
    QObject* avg_accuracy_last_session_text = nullptr;

    QObject* number_of_sequences_text = nullptr;
    QObject* number_of_digits_text = nullptr;
    QObject* time_to_remember_text = nullptr;
    QObject* time_to_answer_text = nullptr;
    QObject* time_to_check_the_answer_text = nullptr;

    bool is_settings_file_created;
    
};


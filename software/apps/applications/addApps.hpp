#pragma once

#include <QAbstractListModel>
#include <QVector>
#include <QString>
#include <qabstractitemmodel.h>
#include <qobject.h>
#include <qtmetamacros.h>
#include <fstream>
#include <iostream> //probably just delete?

struct app{
    QString name;
    double posx;
    double posy;
};

class AppButton : public QAbstractListModel {
    Q_OBJECT

    public:

    private:
        std::ifstream stream;
        std::vector<std::string> appNames; 
        void getApps();
};

#include "addApps.hpp"
#include <QVariantAnimation>
#include <fstream>
#include <linux/limits.h>
#include <string>

RectangleModel::RectangleModel(QObject *parent) : QAbstractListModel(parent) {
  void getApps(){
    std::string name;
    std::ifstream stream("src/apps");
    while (std::getline(stream, name)) {
      appNames.push_back(name); //why can it NOT recognise there is supposed to be a vector?
    }
  }
}

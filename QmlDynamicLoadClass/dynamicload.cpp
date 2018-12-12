#include "dynamicload.h"
#include <QDebug>
DynamicLoad::DynamicLoad(QObject *parent) : QObject(parent)
{
    qDebug()<<"on load";
}

void DynamicLoad::test()
{
    qDebug()<<"test";
}
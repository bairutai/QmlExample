#ifndef DYNAMICLOAD_H
#define DYNAMICLOAD_H

#include <QObject>

class DynamicLoad : public QObject
{
    Q_OBJECT
public:
    explicit DynamicLoad(QObject *parent = nullptr);
public:
    Q_INVOKABLE void test();
signals:

public slots:
};

#endif // DYNAMICLOAD_H
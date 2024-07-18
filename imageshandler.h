#ifndef IMAGESHANDLER_H
#define IMAGESHANDLER_H
#include <QFile>
#include <QList>


class ImagesHandler : public QObject
{
     Q_OBJECT

//Q_PROPERTY(QList<QString> images READ getImages NOTIFY imagesChanged)

public:
    explicit ImagesHandler(QObject *parent = nullptr);
    ~ImagesHandler();

    Q_INVOKABLE QList<QString> getImages();
   Q_INVOKABLE void addImages(QList<QString>  listFilePath);

signals:
   // void deleteRequest(QString filePath);
   // void addRequest(QList<QString>  listFilePath);
    void imagesChanged();

public slots:
    //void addImages(QList<QString>  listFilePath);
   // void deleteImage();




private:
    QList<QString> images = {};

};

#endif // IMAGESHANDLER_H

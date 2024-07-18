#include "imageshandler.h"

ImagesHandler::ImagesHandler(QObject *parent)
    : QObject{parent}
{

}

ImagesHandler::~ImagesHandler(){}

QList<QString> ImagesHandler::getImages()
{
    return this->images;
}

void ImagesHandler::addImages(QList<QString> listFilePath)
{

}


// void ImagesHandler::addImage(QList<QString> ){

// }

// void ImagesHandler::deleteImage(){

// }


// QList<QString> ImagesHandler::getImages(){

//     return this->images;
// }

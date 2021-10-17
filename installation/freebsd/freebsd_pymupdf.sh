setenv CFLAGS -fPIC

# install the pre-required tool
pkg install swig
pkg install freetype2
pkg install gmake

wget https://mupdf.com/downloads/archive/mupdf-1.19.0-source.tar.gz
tar -zxvf mupdf-1.19.0-source.tar.gz

rm -rf PyMuPDF
git clone https://github.com/pymupdf/PyMuPDF.git

cd mupdf-1.19.0-source
# replace files in mupdf source
cp ../PyMuPDF/fitz/_config.h include/mupdf/fitz/config.h

gmake HAVE_X11=no HAVE_GLFW=no HAVE_GLUT=no HAVE_LEPTONICA=yes HAVE_TESSERACT=yes prefix=/usr/local
gmake HAVE_X11=no HAVE_GLFW=no HAVE_GLUT=no HAVE_LEPTONICA=yes HAVE_TESSERACT=yes prefix=/usr/local install

cd ../PyMuPDF
python setup.py build
python setup.py install

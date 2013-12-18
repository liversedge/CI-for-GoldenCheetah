require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

#  depends_on 'qt'

#  def patches
#    {
#      :p0 => [
#        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
#        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff"
#      ]
#    }
#  end
  def patches
    DATA 
  end

  def install
    inreplace "qwtplot3d.pro", "$$INSTALLBASE", "#{prefix}"
    system "cat qwtplot3d.pro"
#    system "qmake -makefile -spec unsupported/macx-clang"
#    system "make install"
  end
end


__END__
--- a/qwtplot3d.pro
+++ b/qwtplot3d.pro
@@ -3,7 +3,7 @@
 
 TARGET            = qwtplot3d
 TEMPLATE          = lib
-CONFIG           += qt warn_on opengl thread zlib debug
+CONFIG           += qt warn_on opengl thread zlib release
 MOC_DIR           = tmp
 OBJECTS_DIR       = tmp
 INCLUDEPATH       = include
@@ -21,7 +21,7 @@
 win32:CONFIG -= zlib
 
 linux-g++:TMAKE_CXXFLAGS += -fno-exceptions
-unix:VERSION = 0.2.6
+unix:VERSION = 0.2.7
 
 # Input
 SOURCES += src/qwt3d_axis.cpp \

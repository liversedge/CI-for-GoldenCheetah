require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.zip'
  sha1 '17f55d37ac93fd17d7f3f6b90031ceb796bfe6d1'

  #depends_on 'qt' => :build
  
  def patches
    { :p0 => [
      "https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
      "https://trac.macports.org/export/94241/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff",
      DATA
    ]}
  end
  
  def install
    system "qmake CONFIG+=release"
    system 'make install'
  end
end

__END__
--- include/qwt3d_openglhelper.h.orig	2012-05-29 15:07:16.000000000 -0400
+++ include/qwt3d_openglhelper.h	2012-05-29 15:08:16.000000000 -0400
@@ -5,6 +5,7 @@
 #if QT_VERSION < 0x040000
 #include <qgl.h>
 #else
+#include <OpenGL/glu.h>
 #include <QtOpenGL/qgl.h>
 #endif
 
---
--- src/qwt3d_function.cpp.orig
+++ src/qwt3d_function.cpp
@@ -1,3 +1,4 @@
+#include <cstdio>
 #include "qwt3d_surfaceplot.h"
 #include "qwt3d_function.h"

---

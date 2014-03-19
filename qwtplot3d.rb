require 'formula'

class Qwtplot3d < Formula
  homepage 'http://qwtplot3d.sourceforge.net/'
  url 'http://downloads.sourceforge.net/sourceforge/qwtplot3d/qwtplot3d-0.2.7.tgz'
  sha1 '4463fafb8420a91825e165da7a296aaabd70abea'

  option 'with-qt5', 'Build using Qt5 backend'
  
  qt_ver = ( build.with?('qt5') ? 'qt5' : 'qt4' )
  qt_path = '#{Formula["#{qt_ver}"].opt_prefix}/bin/qmake'
  
  depends_on "#{qt_ver}"

  def patches
    {
      :p0 => [
        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-qwtplot3d.pro.diff",
        "https://trac.macports.org/export/114349/trunk/dports/graphics/qwtplot3d/files/patch-include_qwt3d_openglhelper.h.diff"
      ]
    }
  end

  def install
    inreplace "qwtplot3d.pro", " qt ", " qt5 "
    inreplace "qwtplot3d.pro", "TARGET            = qwtplot3d", "TARGET            = qwtplot3d-#{qt_ver}"
    inreplace "qwtplot3d.pro", "$$INSTALLBASE", "#{prefix}"
    system "cat qwtplot3d.pro"
    system "#{qt_path}/bin/qmake"
    #system "#{Formula["qt"].opt_prefix}/bin/qmake -makefile -spec unsupported/macx-clang"
    system "make install"
  end
end

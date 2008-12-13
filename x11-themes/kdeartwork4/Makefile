#
# $MidnightBSD: ports/x11-themes/kdeartwork4/Makefile,v 1.57 2008/09/03 13:06:24 miwi Exp $
#

PORTNAME=	kdeartwork
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11-themes kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Artworks Themes
LICENSE=	unknown

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_QT_VER=	4
USE_KDE4=	kdelibs workspace kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
QT_COMPONENTS=	opengl gui moc rcc uic svg qt3support

BUILD_DEPENDS+=	xscreensaver:${PORTSDIR}/x11/xscreensaver
RUN_DEPENDS+=	xscreensaver:${PORTSDIR}/x11/xscreensaver

post-extract:
	${MKDIR} ${WRKSRC}

post-patch:
.for item in kscreensaver/kdesavers/banner.cpp
	${REINPLACE_CMD} -e 's|<qlabel.h>|<QLabel>|'\
			 -e 's|<qlineedit.h>|<QLineEdit>|'\
			 -e 's|<qcombobox.h>|<QComboBox>|'\
			 -e 's|<qcheckbox.h>|<QCheckBox>|'\
			 -e 's|<qslider.h>|<QSlider>|'\
			 -e 's|<qlayout.h>|<QLayout>|'\
			 -e 's|<qdatetime.h>|<QDateEdit>|'\
			 -e 's|<qfontdatabase.h>|<QFontDatabase>|'\
			 -e 's|<qpainter.h>|<QPainter>|'\
			 -e 's|<qfontcombobox.h>|<QFontComboBox>|' \
	    ${WRKSRC}/../${item}
.endfor
.for item in kscreensaver/kdesavers/banner.h kscreensaver/kdesavers/blob.h\
	     kscreensaver/kdesavers/Euphoria.cpp
	${REINPLACE_CMD} -e 's|<qtimer.h>|<QTimer>|'\
	    ${WRKSRC}/../${item}
.endfor
.for item in kscreensaver/kdesavers/blob.cpp
	${REINPLACE_CMD} -e 's|<qcolor.h>|<QColor>|'\
			 -e 's|<qlabel.h>|<QLabel>|'\
			 -e 's|<qlayout.h>|<QLayout>|'\
			 -e 's|<qpainter.h>|<QPainter>|'\
			 -e 's|<qpixmap.h>|<QPixmap>|'\
			 -e 's|<qimage.h>|<QImage>|' \
	    ${WRKSRC}/../${item}
.endfor

.include <bsd.port.mk>

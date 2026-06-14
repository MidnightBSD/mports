PORTNAME=	kitinerary
DISTVERSION=	${KDE_APPLICATIONS_VERSION}
PORTREVISION=	1
CATEGORIES=	net kde kde-applications

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data Model and Extraction System for Travel Reservation information
WWW=		https://www.kde.org/

LICENSE=	lgpl2.1

LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libboost_date_time.so:devel/boost-libs \
		libicui18n.so:devel/icu \
		libphonenumber.so:devel/libphonenumber \
		libpoppler.so:graphics/poppler \
		libprotobuf.so:devel/protobuf \
		libZXing.so:textproc/zxing-cpp

USES=		cmake compiler:c++11-lang gettext gnome kde:6 pkgconfig qt:6 \
		shared-mime-info ssl tar:xz
USE_GL=		gl opengl
USE_GNOME=	libxml2
USE_KDE=	archive codecs coreaddons i18n \
		ecm:build
# Pim components
USE_KDE+=	calendarcore contacts kpkpass mime
USE_QT=		base declarative
USE_LDCONFIG=	yes

DESCR=		${.CURDIR:H:H}/deskutils/kdepim/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>

PORTNAME=	plasma-pass
DISTVERSION=	1.2.2
MASTER_SITES=	KDE/stable/${PORTNAME}
CATEGORIES=	sysutils kde

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plasma applet for Pass password manager
WWW=		https://invent.kde.org/plasma/plasma-pass

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSES/LGPL-2.1-or-later.txt

LIB_DEPENDS=	libassuan.so:security/libassuan \
		libgpg-error.so:security/libgpg-error \
		libgpgme.so:security/gpgme \
		libgpgmepp.so:security/gpgme-cpp  \
		liboath.so:security/oath-toolkit \
		libqgpgmeqt6.so:security/gpgme-qt@qt6
RUN_DEPENDS=	pass:sysutils/password-store

USES=		cmake compiler:c++20-lang gettext kde:6 qt:6 tar:xz
USE_KDE=	i18n itemmodels kio plasma5support \
		ecm:build
USE_QT=		base declarative

.include <bsd.port.mk>

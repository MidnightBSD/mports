# $MidnightBSD$

PORTNAME=	metalink
PORTVERSION=	0.3.6
PORTREVISION=	6
CATEGORIES=	misc
MASTER_SITES=	SF/metalinks/Metalink%20commandline/${PORTVERSION}
PKGNAMESUFFIX?=	-tools

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Metalink generation tool

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libglibmm-2.4.so:devel/glibmm \
		libgpg-error.so:security/libgpg-error \
		libsigc-2.0.so:devel/libsigc++20

USE_GNOME=	glib20
GNU_CONFIGURE=	yes
USES=		compiler:c++11-lang gnome localbase pkgconfig
USE_CXXSTD=	c++11
CONFIGURE_ENV+=	AWK="${AWK}"

PORTDOCS=	README
PLIST_FILES=	bin/${PORTNAME}

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>

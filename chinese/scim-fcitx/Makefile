PORTNAME=	scim
PORTVERSION=	3.1.1
PORTREVISION=	9
CATEGORIES=	chinese
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-fcitx/${PORTVERSION}
PKGNAMESUFFIX=	-fcitx
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SCIM IMEngine module for fcitx
WWW=		http://www.fcitx.org

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	scim:textproc/scim

USES=		compiler:c++11-lang tar:bzip2 gmake libtool:keepla pkgconfig \
		localbase:ldflags
USE_CXXSTD=	c++14

GNU_CONFIGURE=	yes

INSTALL_TARGET=	install-strip

MAKE_JOBS_UNSAFE=	yes

CONFLICTS_INSTALL=	zh-fcitx

WRKSRC=		${WRKDIR}/fcitx

CONFIGURE_ENV+=	SCIM_DATADIR=${PREFIX}/share/scim \
		SCIM_ICONDIR=${PREFIX}/share/scim/icons
LDFLAGS+=	-lintl

SUB_FILES=	pkg-message

.include <bsd.port.mk>

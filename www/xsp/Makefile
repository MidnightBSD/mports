PORTNAME=	xsp
PORTVERSION=	4.7.1
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://download.mono-project.com/sources/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mono based web server
WWW=		https://www.mono-project.com/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

MAKE_JOBS_UNSAFE=	yes

USES=		gmake libtool mono pathfix pkgconfig sqlite
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ENV=	ac_cv_path_GMCS=${LOCALBASE}/bin/mcs
MAKE_ENV=	MONO_REGISTRY_PATH=/tmp/registry
PLIST_SUB=	PORTVERSION=${PORTVERSION}

pre-install:
	${MKDIR} ${XSP_DOCROOT}

.include <bsd.port.mk>

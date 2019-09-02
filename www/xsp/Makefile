PORTNAME=	xsp
PORTVERSION=	4.5
CATEGORIES=	www
MASTER_SITES=	http://download.mono-project.com/sources/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mono based web server

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

MAKE_JOBS_UNSAFE=	yes

USES=		gmake libtool mono pathfix pkgconfig sqlite
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_path_GMCS=${LOCALBASE}/bin/mcs

PLIST_SUB+=	PORTVERSION=${PORTVERSION}

pre-install:
	${MKDIR} ${STAGEDIR}${XSP_DOCROOT}

.include <bsd.port.mk>

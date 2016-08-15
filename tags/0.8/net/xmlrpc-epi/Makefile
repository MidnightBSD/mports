# New ports collection makefile for:	xmlrpc-epi
# Date created:			Feb 26, 2008
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	xmlrpc-epi
PORTVERSION=	0.54.2
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-base/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose implementation of the xmlrpc specification in C

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexpat.so:${PORTSDIR}/textproc/expat2

USE_LDCONFIG=	yes
USES=	libtool gmake iconv tar:bzip2
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -liconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-transform="s|^|xre-|" \
		--with-expat=/usr/local
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd9.1
INSTALL_TARGET=	install-strip

PORTDOCS=	AUTHORS ChangeLog NEWS README

METHODS=	TestNormal TestFault TestStruct TestArray TestBoolean	\
		TestInt TestString TestDouble TestBase64 TestDateTime

CONFLICTS=	xmlrpc-c-0.* xmlrpc-c-devel-[0-9]*

pre-configure:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS}	\
	${REINPLACE_CMD} -e '/^LTCOMPILE =/s/--mode=/--tag=CC --mode=/'
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS}	\
	${REINPLACE_CMD} -e '/^LINK =/s/--mode=/--tag=CC --mode=/'

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

regression-test:
.for tm in ${METHODS}
	cd ${WRKSRC}/sample &&	\
	./sample -method method_${tm}
.endfor

.include <bsd.port.mk>

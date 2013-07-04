# $MidnightBSD: mports/archivers/arj/Makefile,v 1.7 2011/02/02 20:03:21 laffer1 Exp $

PORTNAME=	arj
PORTVERSION=	3.10.22
PORTREVISION=	3
CATEGORIES=	archivers
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/2.78_3.10%20build%2022

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source ARJ
LICENSE=	gpl2

MAKE_JOBS_UNSAFE=	yes

USE_AUTOTOOLS=	autoconf
USE_GMAKE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
CONFIGURE_WRKSRC=	${WRKSRC}/gnu
CONFIGURE_ENV=	CFLAGS="-fPIC"
MAKEFILE=	GNUmakefile
STRIP=
LANGUAGE?=	en
MAKE_ENV+=	"LOCALE=${LANGUAGE}"

MAN1=		arj-register.1 arj.1 arjdisp.1 rearj.1

post-patch:
	@${REINPLACE_CMD} -e 's!/etc!${LOCALBASE}/etc!' \
		 ${WRKSRC}/arj.c ${WRKSRC}/file_reg.c ${WRKSRC}/rearj.c
	@${REINPLACE_CMD} -e 's!-O2!!' ${WRKSRC}/gnu/configure.in
	@${REINPLACE_CMD} -e 's!^static !!' ${WRKSRC}/integr.c
	@${REINPLACE_CMD} -e 's!strnlen!_strnlen!g' ${WRKSRC}/fardata.c

pre-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} prepare)

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/doc && ${INSTALL_DATA} COPYING debug.txt ${DOCSDIR}
	cd ${WRKSRC}/resource/en && \
		${INSTALL_DATA} arjl.txt arjs.txt history.txt readme.txt unix.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>

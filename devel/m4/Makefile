PORTNAME=	m4
PORTVERSION=	1.4.18
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU M4

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		makeinfo tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--infodir=${PREFIX}/info --mandir=${PREFIX}/man \
		--program-prefix=g
CONFIGURE_ENV=	MAKEINFO="${MAKEINFO} --no-split"

EXAMPLESDIR=	share/examples/gm4
INFO=	m4

OPTIONS_DEFINE=	LIBSIGSEGV EXAMPLES
LIBSIGSEGV_DESC=Use alternative page fault handler (GNU libsigsegv)

LIBSIGSEGV_CONFIGURE_WITH=	libsigsegv-prefix=${LOCALBASE}
LIBSIGSEGV_LIB_DEPENDS=		libsigsegv.so:devel/libsigsegv

post-patch:
	@${REINPLACE_CMD} -e '/^* M4: / s|M4|G&|' ${WRKSRC}/doc/m4.texi
	@${REINPLACE_CMD} -e '/^install-exec-am: / s| .*||' ${WRKSRC}/lib/Makefile.in

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.m4 ${FAKE_DESTDIR}${PREFIX}/${EXAMPLESDIR}

.include <bsd.port.mk>

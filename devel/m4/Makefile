# $MidnightBSD$

PORTNAME=	m4
PORTVERSION=	1.4.18
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU m4

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		makeinfo tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--infodir=${PREFIX}/info --mandir=${PREFIX}/man \
		--program-prefix=g

OPTIONS=	LIBSIGSEGV "Use libsigsegv for better diagnostics" Off \
		CHANGEWORD "Use change word" Off

.include <bsd.mport.options.mk>

.if defined(WITH_CHANGEWORD)
CONFIGURE_ARGS+=	--enable-changeword
.endif

INFO=	m4

EXAMPLESDIR=	share/examples/gm4

.if defined(WITH_LIBSIGSEGV)
LIB_DEPENDS+=	sigsegv:${PORTSDIR}/devel/libsigsegv
CONFIGURE_ARGS+=	--with-libsigsegv-prefix=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--without-libsigsegv-prefix
.endif

.include <bsd.port.pre.mk>

CONFIGURE_ENV+= MAKEINFO="makeinfo --no-split"

post-install:
	@${MKDIR} ${PREFIX}/${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.m4 ${PREFIX}/${EXAMPLESDIR}

.include <bsd.port.post.mk>

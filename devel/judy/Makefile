PORTNAME=	Judy
DISTVERSION=	1.0.5
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME:tl}/${PORTNAME:tl}/${PORTNAME}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose dynamic array
WWW=		https://judy.sourceforge.net/

LICENSE=        lgpl

BROKEN_mips=		fails to compile: unrecognized command line option "-m32"
BROKEN_mips64=		fails to compile: unrecognized command line option "-m64"

USES=		gmake libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes
INSTALL_TARGET=	install-strip

WRKSRC=	${WRKDIR}/${PORTNAME:tl}-${DISTVERSION}

PORTDOCS=	COPYRIGHT README *.htm
OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${ARCH} == armv6 || ${ARCH} == armv7 || ${ARCH} == i386 || ${ARCH} == mips || ${ARCH} == powerpc
CONFIGURE_ARGS+=	--enable-32-bit
.else
CONFIGURE_ARGS+=	--enable-64-bit
.endif

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S!^!${WRKSRC}/doc/ext/!} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.post.mk>

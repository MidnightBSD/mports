# $MidnightBSD$

PORTNAME=	9base
DISTVERSION=	b20100604
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://dl.suckless.org/tools/
DISTNAME=	${PORTNAME}-6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port of various original plan9 tools

LICENSE=	mit

CFLAGS+=	-I. -c
LDFLAGS+=	-L.
MANPREFIX=	${PREFIX}/9
MAKE_ARGS=	PREFIX="${PREFIX}/9" CC="${CC}" MANPREFIX="${MANPREFIX}/man" \
		CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
MAKE_JOBS_UNSAFE=	yes
APPS=		ascii awk basename bc cal cat cleanname cmp date dc du dd diff echo ed \
		factor fortune fmt freq getflags grep hoc join look ls mk mkdir mtime pbd \
		primes rc read sam sha1sum sed seq sleep sort split strings tail tee test \
		touch tr troff unicode uniq unutf yacc

post-patch:
	@${REINPLACE_CMD} -e 's|PREFIX|"${PREFIX}/9"|' ${WRKSRC}/lib9/get9root.c
	@${REINPLACE_CMD} -e '/OBJTYPE!=/s|!=.*|=${ARCH:S,i386,386,:S,amd64,x86_64,:S,sparc64,sun4u,}|' ${WRKSRC}/lib9/Makefile

.include <bsd.port.mk>

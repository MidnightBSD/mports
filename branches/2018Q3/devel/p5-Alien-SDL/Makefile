# $MidnightBSD$
# $FreeBSD: head/devel/p5-Alien-SDL/Makefile 383802 2015-04-11 14:09:35Z mat $

PORTNAME=	Alien-SDL
PORTVERSION=	1.440
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Detect and get configuration setting for SDL

LICENSE=	gpl2

BUILD_DEPENDS:=	${RUN_DEPENDS} \
		p5-Text-Patch>=1.4:${PORTSDIR}/textproc/p5-Text-Patch
RUN_DEPENDS=	p5-File-Which>=0:${PORTSDIR}/sysutils/p5-File-Which \
		p5-File-ShareDir>=0:${PORTSDIR}/devel/p5-File-ShareDir \
		p5-Capture-Tiny>=0:${PORTSDIR}/devel/p5-Capture-Tiny

USES=		perl5
USE_PERL5=	modbuild
PERL_MODBUILD=	yes
USE_SDL=	gfx image mixer pango sdl ttf
CONFIGURE_ARGS=	--with-sdl-config=${SDL_CONFIG}

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} >= 502000
BUILD_DEPENDS+=	p5-Archive-Extract>=0:${PORTSDIR}/archivers/p5-Archive-Extract
RUN_DEPENDS+=	p5-Archive-Extract>=0:${PORTSDIR}/archivers/p5-Archive-Extract
.endif

.include <bsd.port.post.mk>

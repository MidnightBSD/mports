# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@sunpoet.net>

PORTNAME=	mp3lint
PORTVERSION=	0.9
CATEGORIES=	audio perl5
MASTER_SITES=	https://erislabs.net/ianb/projects/mp3lint/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configurable tool to check collections of audio files

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${RUN_DEPENDS} \
		${P5_POD_PARSER}
RUN_DEPENDS=	libmp3-archive-perl>=0:audio/libmp3-archive-perl

USES=		perl5
USE_PERL5=	configure

MAKE_JOBS_UNSAFE=	yes
NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^INSTALLSYSCONFDIR/ s|/etc|${PREFIX}&|' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>

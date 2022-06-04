# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@sunpoet.net>

PORTNAME=	libmp3-archive-perl
PORTVERSION=	0.9
CATEGORIES=	audio perl5
MASTER_SITES=	http://erislabs.net/ianb/projects/libmp3-archive-perl/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to manipulate filenames containing music metadata

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^INSTALLSYSCONFDIR/ s|/etc|${PREFIX}&|' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>

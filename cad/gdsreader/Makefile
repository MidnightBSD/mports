PORTNAME=	gdsreader
PORTVERSION=	0.3.2
CATEGORIES=	cad
MASTER_SITES=	FREEBSD_LOCAL/hrs
DISTNAME=	GDSreader.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GDS2 stream file to Postscript and HP/GL converter

LICENSE=	gpl2

FAKE_OPTS=	trueprefix

PORTDOCS=	README README.povray ChangeLog
PORTEXAMPLES=	layers.config test.gds layers.config.7HP.5ML \
		layers.config.5AM.4ML
PLIST_FILES=	bin/gdsreader bin/maptolayer \
		share/man/man1/gdsreader.1.gz share/man/man1/maptolayer.1.gz

INSTALL_TARGET=	install install-data install-docs

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.port.mk>

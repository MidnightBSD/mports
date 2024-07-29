PORTNAME=	psutils
PORTVERSION=	1.17
CATEGORIES=	print
MASTER_SITES=	ftp://ftp.dcs.ed.ac.uk/pub/ajcd/ \
		ftp://ftp.knackered.org/pub/psutils/ \
		TEX_CTAN/support/psutils
DISTNAME=	psutils-p17

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for manipulating PostScript documents

LICENSE=	PSUTILS
LICENSE_NAME=	PS Utilities License
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libpaper.so:print/libpaper

USES=		perl5
USE_PERL5=	build
WRKSRC=		${WRKDIR}/${PORTNAME}
MAKEFILE=	Makefile.unix
MAKE_ENV+=	DATADIR="${DATADIR}" PERL="${PERL}" CHMOD="${CHMOD}"
SCRIPTS_ENV+=	PERL5=${PERL} CC=${CC} DATADIR=${DATADIR} \
		PAPER=dummy

.include <bsd.port.mk>

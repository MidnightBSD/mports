# This port is self contained in the src directory.

PORTNAME=	portlint
PORTVERSION=	2.22.1
PORTREVISION=	1
CATEGORIES=	ports-mgmt
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verifier for mports directory

LICENSE=	ITOJUN
LICENSE_NAME=	Itojun License
LICENSE_TEXT=	All rights reserved. Freely redistributable.  Absolutely no warranty.
LICENSE_PERMS=	auto-accept dist-mirror dist-sell pkg-mirror pkg-sell

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/src
USES=         perl5 shebangfix
SHEBANG_FILES=        *.pl
USE_PERL5=    run

SRC=		${.CURDIR}/src

PLIST_FILES=	bin/portlint \
		share/man/man1/portlint.1.gz

PORTEXAMPLES=	portlintgrep

OPTIONS_DEFINE=	EXAMPLES

do-extract:
	@${CP} -R ${SRC} ${WRKDIR}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/portlint.pl \
	    ${PREFIX}/bin/portlint
	${INSTALL_MAN} ${WRKSRC}/portlint.1 \
	    ${PREFIX}/share/man/man1
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/portlintgrep.pl \
	    ${EXAMPLESDIR}/portlintgrep

.include <bsd.port.mk>

# Created by: Jun-ichiro itojun Hagino <itojun@itojun.org>
# $MidnightBSD$
#
# This port is self contained in the src directory.

PORTNAME=	portlint
PORTVERSION=	2.18.3
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
USE_PERL5_RUN=	yes

SRC=		${.CURDIR}/src

PLIST_FILES=	bin/portlint \
		man/man1/portlint.1.gz

PORTEXAMPLES=	portlintgrep

OPTIONS_DEFINE=	EXAMPLES

pre-patch:
	@${CP} -R ${SRC} ${WRKDIR}

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/perl|${PERL}|' \
		${WRKSRC}/portlint.pl \
		${WRKSRC}/portlintgrep.pl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/portlint.pl \
	    ${PREFIX}/bin/portlint
	${INSTALL_MAN} ${WRKSRC}/portlint.1 \
	    ${MAN1PREFIX}/man/man1
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/portlintgrep.pl \
	    ${EXAMPLESDIR}/portlintgrep

.include <bsd.port.mk>

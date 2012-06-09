# $MidnightBSD: mports/devel/autoconf/Makefile,v 1.2 2012/04/26 13:07:23 laffer1 Exp $

PORTNAME=	autoconf
PORTVERSION=	2.69
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	autoconf
DISTNAME=	autoconf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically configure source code on many Un*x platforms
LICENSE=	gpl3

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4 \
		help2man:${PORTSDIR}/misc/help2man
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4 \
		autoconf-wrapper:${PORTSDIR}/devel/autoconf-wrapper

BUILD_VERSION=	2.69
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	autoconf269
USE_GMAKE=	yes
USE_PERL5=	yes
INFO=		autoconf-${BUILD_VERSION}

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	CONFIG_SHELL=${SH} M4=${LOCALBASE}/bin/gm4 AWK=${AWK}
CONFIGURE_ARGS=	--program-suffix=-${BUILD_VERSION} --without-lispdir

GENERIC_TOOLS=	config.guess config.sub	elisp-comp install-sh mdate-sh missing
GENERIC_LINKS=	autoconf autoheader autom4te autoreconf autoscan autoupdate \
		ifnames

MAN1_PAGES=	${GENERIC_LINKS} config.guess config.sub
MAN1=		${MAN1_PAGES:S/$/-${BUILD_VERSION}.1/g}

post-patch:
	@(cd ${WRKSRC}/man && \
		for file in *.[1x]; do \
			${REINPLACE_CMD} -E 's,([^-]auto)(conf|make|reconf|update|header|scan),\1\2-${BUILD_VERSION},g ; \
						s,(config\.guess|config\.sub|ifnames),\1-${BUILD_VERSION},g' $$file ; \
		done)
	@(cd ${WRKSRC}/doc && \
		${RM} -f *.info && \
		${MV} autoconf.texi autoconf-${BUILD_VERSION}.texi)
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|@PACKAGE@$$|@PACKAGE@-@VERSION@|'

post-install:
.for FILE in ${GENERIC_TOOLS}
	@${INSTALL_SCRIPT} ${WRKSRC}/build-aux/${FILE} ${PREFIX}/share/autoconf-${BUILD_VERSION}
.endfor

.include <bsd.port.mk>

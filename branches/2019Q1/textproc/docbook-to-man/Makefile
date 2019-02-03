# $MidnightBSD$

PORTNAME=	docbook-to-man
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://www.oasis-open.org/docbook/tools/dtm/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DocBook SGML DTD into nroff/troff -man macros converter

LICENSE=	unknown

RUN_DEPENDS=	docbook>0:${PORTSDIR}/textproc/docbook

FAKE_OPTS=	trueprefix

.include <bsd.port.pre.mk>

# Global variables
#

# There are two ports that satisfy the nsgmls requirement.
# Jade is preferred.

.if defined(WITH_OPENJADE)
RUN_DEPENDS=	onsgmls:${PORTSDIR}/textproc/openjade
.else
RUN_DEPENDS=	nsgmls:${PORTSDIR}/textproc/jade
.endif

USE_IMAKE=	yes
XFREE86_HTML_MAN= no

.if defined(WITH_OPENJADE)
NSGMLS=		onsgmls
.else
NSGMLS=		nsgmls
.endif

# Post extract
#

post-extract: move-instant.1

move-instant.1:
	@${MV} ${WRKSRC}/Doc/instant.1 ${WRKSRC}/Instant/oinstant.man

# Post patch
#

post-patch: patch-docbook-to-man

patch-docbook-to-man:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|;s|%%NSGMLS%%|${NSGMLS}|' \
		${WRKSRC}/cmd/docbook-to-man.sh

.include <bsd.port.post.mk>

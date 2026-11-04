PORTNAME=	sgmlformat
PORTVERSION=	1.7
PORTREVISION=	5
CATEGORIES=	textproc print
MASTER_SITES=	FREEBSD_LOCAL/kuriyama

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generates groff and HTML from linuxdoc and docbook SGML documents

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

# There are two ports that satisfy the nsgmls requirement.
# Jade is preferred.

.include <bsd.port.pre.mk>

.if defined(PACKAGE_BUILDING) || ${MACHINE_ARCH} != "i386"
WITH_OPENJADE=	yes
.endif

.if defined(WITH_OPENJADE)
RUN_DEPENDS=	openjade>0:textproc/openjade
.else
RUN_DEPENDS=	nsgmls:textproc/jade
.endif
RUN_DEPENDS+=	linuxdoc>0:textproc/linuxdoc \
		docbook-sgml>0:textproc/docbook-sgml \
		groff:textproc/groff

.if defined(WITH_OPENJADE)
post-patch:
	@${REINPLACE_CMD} -e 's,nsgmls,onsgmls,g' ${WRKSRC}/sgmlfmt/sgmlfmt.pl
	@${REINPLACE_CMD} -e 's,nsgmls,onsgmls,g' ${WRKSRC}/instant/traninit.c
	@( cd ${WRKSRC}/transpec && \
	  ${REINPLACE_CMD} 's,/usr/share/tmac,${PREFIX}/share/groff/current/tmac,' \
	  docbook-roff.ts iso12083article-roff.ts linuxdoc-roff.ts )
.endif

post-build:
.if ${OSVERSION} >= 302000
	${REINPLACE_CMD} -E 's#(/usr|${TRUE_PREFIX})/bin/perl#${PERL}#' ${WRKSRC}/sgmlfmt/sgmlfmt
.endif

pre-install:
	${MKDIR} ${PREFIX}/share/sgml/transpec

.include <bsd.port.post.mk>

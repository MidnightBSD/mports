# $MidnightBSD: mports/textproc/sgmlformat/Makefile,v 1.5 2009/10/19 01:34:01 laffer1 Exp $

PORTNAME=	sgmlformat
PORTVERSION=	1.7
PORTREVISION=	3
CATEGORIES=	textproc print
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	kuriyama

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
RUN_DEPENDS=	onsgmls:${PORTSDIR}/textproc/openjade
.else
RUN_DEPENDS=	nsgmls:${PORTSDIR}/textproc/jade
.endif
RUN_DEPENDS+=	${PREFIX}/share/sgml/linuxdoc:${PORTSDIR}/textproc/linuxdoc \
		${PREFIX}/share/sgml/docbook:${PORTSDIR}/textproc/docbook

USE_PERL5_RUN=	yes

MAN1=		instant.1 sgmlfmt.1
MAN5=		transpec.5
MANCOMPRESSED=	yes

.if defined(WITH_OPENJADE)
post-patch:
	@${REINPLACE_CMD} -e 's,nsgmls,onsgmls,g' ${WRKSRC}/sgmlfmt/sgmlfmt.pl
	@${REINPLACE_CMD} -e 's,nsgmls,onsgmls,g' ${WRKSRC}/instant/traninit.c
.endif


.include <bsd.port.post.mk>

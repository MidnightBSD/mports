# $MidnightBSD$

PORTNAME=	sgmlformat
PORTVERSION=	1.7
PORTREVISION=	4
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
		docbook-sgml>0:${PORTSDIR}/textproc/docbook-sgml

USE_PERL5_RUN=	yes

.if defined(WITH_OPENJADE)
post-patch:
	@${REINPLACE_CMD} -e 's,nsgmls,onsgmls,g' ${WRKSRC}/sgmlfmt/sgmlfmt.pl
	@${REINPLACE_CMD} -e 's,nsgmls,onsgmls,g' ${WRKSRC}/instant/traninit.c
.endif


.include <bsd.port.post.mk>

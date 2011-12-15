# ex:ts=8
#
# $MidnightBSD: mports/science/openbabel/Makefile,v 1.4 2011/02/02 21:19:20 laffer1 Exp $
#

PORTNAME=	openbabel
PORTVERSION=	2.2.0
PORTREVISION=	1
CATEGORIES=	science
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Chemistry file translation program
LICENSE=	gpl2

LIB_DEPENDS=	boost_thread.4:${PORTSDIR}/devel/boost-python

USE_GNOME=	gnomehack  libxml2
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

MAN1=		obchiral.1 obconformer.1 obenergy.1 obfit.1 obgen.1 obgrep.1 \
		obminimize.1 obprobe.1 obprop.1 obrotamer.1 obrotate.1 \
		openbabel.1 roundtrip.1

PLIST_SUB=	VERSION="${PORTVERSION}"

.include <bsd.port.pre.mk>

post-extract:
	@${LN} -sf babel.1 ${WRKSRC}/doc/openbabel.1

post-patch:
	@${REINPLACE_CMD} -e \
		'/test/s| == | = |g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		's|= babel|= openbabel|g' ${WRKSRC}/doc/Makefile.in
	@${REINPLACE_CMD} -e 's| babel| openbabel|g ; \
		 s|"babel|"openbabel|g' ${WRKSRC}/doc/o*.1
	@${REINPLACE_CMD} -e 's|babel$$(EXEEXT)|openbabel$$(EXEEXT)|g' ${WRKSRC}/tools/Makefile.in

.include <bsd.port.post.mk>

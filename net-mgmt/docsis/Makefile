PORTNAME=	docsis
PORTVERSION=	0.9.8
DISTVERSIONPREFIX=	upstream/
CATEGORIES=	net-mgmt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DOCSIS(tm) binary configuration file encoder/decoder

LICENSE=	gpl2

BUILD_DEPENDS=	gm4:devel/m4 \
		flex:textproc/flex
LIB_DEPENDS=	libnetsnmp.so:net-mgmt/net-snmp

GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes
USES=		autoreconf bison libtool ssl
USE_GITHUB=	yes

PLIST_SUB=	MIBS=share/snmp/mibs

OPTIONS_DEFINE=	DOCS EXAMPLES

GH_ACCOUNT=	rlaager

post-patch:
	@${REINPLACE_CMD} -e \
		'/^htmldocdir/s|share/docsis|share/doc/docsis|' \
		${WRKSRC}/doc/Makefile.am
	@${REINPLACE_CMD} -e \
		'/^examplesdir/s|docsis/examples|examples/docsis|' \
		${WRKSRC}/examples/Makefile.am

.include <bsd.port.mk>

# $MidnightBSD$

PORTNAME=	docsis
PORTVERSION=	0.9.5
PORTREVISION=	2
CATEGORIES=	net-mgmt
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DOCSIS(tm) binary configuration file encoder/decoder
LICENSE=	gpl2

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
LIB_DEPENDS=	netsnmp:${PORTSDIR}/net-mgmt/net-snmp

GNU_CONFIGURE=	yes
USE_OPENSSL=	yes
USE_BISON=	build

PLIST_SUB=	MIBS=share/snmp/mibs

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
BROKEN=		Produces corrupt files on amd64
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|^htmldocdir =.*|htmldocdir = ${DOCSDIR}|' ${WRKSRC}/doc/Makefile.in
	@${REINPLACE_CMD} -e 's|^examplesdir =.*|examplesdir = ${EXAMPLESDIR}|' ${WRKSRC}/examples/Makefile.in

.include <bsd.port.post.mk>

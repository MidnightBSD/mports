# $MidnightBSD: mports/security/openpgpsdk/Makefile,v 1.3 2009/02/28 17:20:36 laffer1 Exp $

PORTNAME=	openpgpsdk
PORTVERSION=	0.9
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://openpgp.nominet.org.uk/downloads/
EXTRACT_SUFX=	.tgz

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	OpenPGP SDK
LICENSE=	bsd3

USE_PERL5=	yes
USE_OPENSSL_BASE=	yes
HAS_CONFIGURE=	YES
#USE_AUTOTOOLS=	autoheader:262
CONFIGURE_ARGS=	--without-idea --with-cunit=${LOCALBASE}

LIB_DEPENDS=	cunit.1:${PORTSDIR}/devel/cunit

.include <bsd.port.pre.mk>

# Check if this port can't build.. 0.2.1 or 0.1.1 don't have 
# recent openssl.  We don't really deal with port versions yet.
.if (${OSVERSION} > 600000)
BROKEN=	This port requires .98 openssl
.endif

.if (${OSVERSION} < 3000)
BROKEN=	This port requires .98 openssl
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/openpgp ${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/lib/libops.a ${PREFIX}/lib/

.include <bsd.port.post.mk>

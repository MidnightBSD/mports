# $MidnightBSD: mports/security/openpgpsdk/Makefile,v 1.1 2009/02/08 23:30:08 laffer1 Exp $

PORTNAME=	openpgpsdk
PORTVERSION=	0.9
CATEGORIES=	security
MASTER_SITES=	http://openpgp.nominet.org.uk/downloads/
EXTRACT_SUFX=	.tgz

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	OpenPGP SDK
LICENSE=	bsd3

USE_PERL5=	yes
HAS_CONFIGURE=	YES
USE_AUTOTOOLS=	autoheader:262
CONFIGURE_ARGS=	--without-idea --with-cunit=${LOCALBASE}

LIB_DEPENDS=	cunit.1:${PORTSDIR}/devel/cunit

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/openpgp ${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/lib/libops.a ${PREFIX}/lib/

.include <bsd.port.post.mk>

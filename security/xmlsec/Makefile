# $MidnightBSD: mports/security/xmlsec/Makefile,v 1.3 2009/04/14 23:41:52 laffer1 Exp $

PORTNAME=	xmlsec
PORTVERSION=	0.0.15
PORTREVISION=	4
CATEGORIES=	security
MASTER_SITES=	http://www.aleksey.com/xmlsec/download/ \
		ftp://ftp.aleksey.com/pub/xmlsec/releases/ \
		ftp://ftp.xmlsoft.org/xmlsec/releases/ \
		ftp://ftp.rpmfind.net/pub/XML/xmlsec/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML Security Library
LICENSE=	mit

RUN_DEPENDS=	pkg-config:${PORTSDIR}/devel/pkg-config
BUILD_DEPENDS=	${RUN_DEPENDS}

USE_OPENSSL=	yes
USE_GNOME=	gnomehack libxslt
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes

MAN1=	xmlsec.1 xmlsec-config.1

.include <bsd.port.pre.mk>

.if (${OSVERSION} < 600000 && ${OSVERSION} > 2999)
BROKEN=	Does not build on 0.3+
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${TAR} -C ${WRKSRC}/docs -cf - . | ${TAR} -C ${DOCSDIR} -xf -
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>

# $MidnightBSD$

PORTNAME=	tarsnap
PORTVERSION=	1.0.36
PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	http://www.tarsnap.com/download-http/
DISTNAME=	${PORTNAME}-autoconf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Online encrypted backup service (client)

LICENSE=	tarsnap
LICENSE_NAME=	The Tarsnap License
LICENSE_FILE=	${WRKSRC}/COPYING
LICENSE_PERMS=	dist-mirror pkg-mirror

GNU_CONFIGURE=	yes
USES=		gmake tar:tgz

.include <bsd.mport.options.mk>

# safety check to ensure that we don't violate the license
.if exists(${PATCHDIR})
RESTRICTED=	license only allows redistribution and use of unmodified source and binaries
.endif
LEGAL_TEXT=	license restricts redistribution of source and binaries

post-install:
	@if [ ! -f ${PREFIX}/etc/tarsnap.conf ]; then \
	    ${CP} -p ${PREFIX}/etc/tarsnap.conf.sample ${PREFIX}/etc/tarsnap.conf ; \
	fi

.include <bsd.port.mk>

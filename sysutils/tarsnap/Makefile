# $MidnightBSD$

PORTNAME=	tarsnap
PORTVERSION=	1.0.33
CATEGORIES=	sysutils
MASTER_SITES=	http://www.tarsnap.com/download-http/
DISTNAME=	${PORTNAME}-autoconf-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Online encrypted backup service (client)
LICENSE=	restricted

RESTRICTED=	license restricts redistribution of source and binaries

GNU_CONFIGURE=	yes
USE_GMAKE=	yes

MAN1=		tarsnap.1 tarsnap-keygen.1 tarsnap-keymgmt.1	\
		tarsnap-keyregen.1 tarsnap-recrypt.1
MAN5=		tarsnap.conf.5

OPTIONS_DEFINE=	SSE2
SSE2_DESC=	Use SSE2-optimized code

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSSE2}
CONFIGURE_ARGS+=	--enable-sse2
CFLAGS+=		-msse2
.else
CONFIGURE_ARGS+=	--disable-sse2
.endif

post-install:
	@if [ ! -f ${PREFIX}/etc/tarsnap.conf ]; then \
	    ${CP} -p ${PREFIX}/etc/tarsnap.conf.sample ${PREFIX}/etc/tarsnap.conf ; \
	fi

.include <bsd.port.mk>

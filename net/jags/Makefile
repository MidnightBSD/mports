# $MidnightBSD$

PORTNAME=	jags
PORTVERSION=	0.22.1
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/Jags/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JAGS - Just Another GTK+ Samba Client
LICENSE=	gpl2

RUN_DEPENDS=	smbclient:${PORTSDIR}/${SAMBA_PORT}

SAMBA_PORT?=	net/samba36

CONFLICTS=	jags-1.*

USES=		gmake
USE_XORG=	xi xext x11
USE_GNOME=	gtk12
GNU_CONFIGURE=	yes

.include <bsd.port.mk>

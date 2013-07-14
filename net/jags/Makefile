# $MidnightBSD: mports/net/jags/Makefile,v 1.2 2010/10/19 20:14:31 laffer1 Exp $

PORTNAME=	jags
PORTVERSION=	0.22.1
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/Jags/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JAGS - Just Another GTK+ Samba Client
LICENSE=	gpl2

RUN_DEPENDS=	smbclient:${PORTSDIR}/${SAMBA_PORT}

SAMBA_PORT?=	net/samba36

CONFLICTS=	jags-1.*

USE_GMAKE=	yes
USE_XORG=	xi xext x11
USE_GNOME=	gtk12
GNU_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 700042
CFLAGS+=	-ffriend-injection
.endif

.include <bsd.port.post.mk>

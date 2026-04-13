PORTNAME=	calife
PORTVERSION=	3.0.6
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	https://assets.keltia.net/calife/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight alternative to sudo
WWW=		https://www.keltia.net/programs/calife

LICENSE=	gpl2

USES=		cpe tar:xz

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-etcdir=${PREFIX}/etc

CONFIGURE_ARGS+=	--with-pam

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/calife ${PREFIX}/bin/calife
	${INSTALL_MAN} ${WRKSRC}/calife.1 ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/calife.auth.5 ${PREFIX}/share/man/man5
	${INSTALL_DATA} ${WRKSRC}/calife.auth-dist ${PREFIX}/etc/calife.auth.sample
	${INSTALL_DATA} ${WRKSRC}/pam/freebsd9 ${PREFIX}/etc/pam.d/calife.sample

.include <bsd.port.mk>

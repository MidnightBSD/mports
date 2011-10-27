# $MidnightBSD: mports/sysutils/smartmontools/Makefile,v 1.2 2011/10/23 15:41:15 laffer1 Exp $

PORTNAME=	smartmontools
PORTVERSION=	5.42
CATEGORIES=	sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	S.M.A.R.T. disk monitoring tools
LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dependency-tracking \
		--enable-drivedb --enable-sample \
		--with-docdir=${DOCSDIR} --with-initscriptdir=${PREFIX}/etc/rc.d

SUB_FILES=	pkg-message smart
USE_RC_SUBR=	smartd

MAN5=		smartd.conf.5
MAN8=		smartd.8 smartctl.8

CFLAGS:=	${CFLAGS:S/-O2/-O/} -Wno-write-strings

post-patch:
	@${REINPLACE_CMD} -e 's| install-initdDATA| |' ${WRKSRC}/Makefile.in

post-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${WRKDIR}/smart ${PREFIX}/etc/periodic/daily/smart
	${INSTALL_SCRIPT} ${WRKSRC}/smartd.freebsd.initd ${PREFIX}/etc/rc.d/smartd

.include <bsd.port.mk>

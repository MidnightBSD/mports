# $MidnightBSD: mports/devel/tmake/Makefile,v 1.3 2008/10/20 19:30:13 laffer1 Exp $
# $FreeBSD: ports/devel/tmake/Makefile,v 1.16 2006/12/06 17:54:34 rafan Exp $

PORTNAME=	tmake
PORTVERSION=	1.7
PORTREVISION=	3
CATEGORIES=	devel perl5
MASTER_SITES=	ftp://ftp.trolltech.com/freebies/tmake/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely portable perl-based make utility
LICENSE=	other

USE_PERL5=	yes
USE_QT_VER=	3
NO_BUILD=	yes
TMAKE_BIN=	progen tmake

REINPLACE_ARGS=	-i "" # no backup (for install)

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/local,${LOCALBASE},g; \
		s,/usr/X11R6,${LOCALBASE},g' \
		${WRKSRC}/lib/freebsd-g++/tmake.conf

do-install:
	@${MKDIR} ${PREFIX}/share/tmake
	@cd ${WRKSRC}/lib; tar cf - * | (cd ${PREFIX}/share/tmake && tar xf -)
.for f in ${TMAKE_BIN}
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/${f} ${PREFIX}/bin
.endfor

post-fake:
	@${ECHO}
	@${ECHO} "Make sure to set your TMAKEPATH environment variable"
	@${ECHO} "to ${PREFIX}/share/tmake/freebsd-g++."
	@${ECHO}

.include <bsd.port.mk>

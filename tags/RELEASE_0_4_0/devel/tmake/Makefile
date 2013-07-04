# $MidnightBSD: mports/devel/tmake/Makefile,v 1.4 2011/03/11 22:17:20 laffer1 Exp $
# $FreeBSD: ports/devel/tmake/Makefile,v 1.16 2006/12/06 17:54:34 rafan Exp $

PORTNAME=	tmake
PORTVERSION=	1.13
CATEGORIES=	devel perl5
MASTER_SITES=	ftp://ftp.trolltech.com/freebies/tmake/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely portable perl-based make utility
LICENSE=	other

NO_BUILD=	yes
REINPLACE_ARGS=	-i ''
USE_PERL5=	yes

post-patch:
	@${RM} -f ${WRKSRC}/bin/tmake.orig ${WRKSRC}/lib/unix/generic.t.orig
	@${REINPLACE_CMD} \
		-e 's|/usr/local|${LOCALBASE}|g' \
		-e 's|/usr/X11R6|${LOCALBASE}|g' \
		-e '/^TMAKE_CFLAGS_RELEASE/ s| -O[0-9]||' \
			${WRKSRC}/lib/freebsd-g++/tmake.conf

do-install:
	@${MKDIR} ${DATADIR}/
	@cd ${WRKSRC}/lib/ && ${COPYTREE_SHARE} . ${DATADIR}/
	@cd ${WRKSRC}/bin/ && ${INSTALL_SCRIPT} progen tmake ${PREFIX}/bin/

post-fake:
	@${ECHO}
	@${ECHO} "Make sure to set your TMAKEPATH environment variable"
	@${ECHO} "to ${PREFIX}/share/tmake/freebsd-g++."
	@${ECHO}

.include <bsd.port.mk>

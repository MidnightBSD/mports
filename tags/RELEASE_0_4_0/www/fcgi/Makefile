# $MidnightBSD: mports/www/fcgi/Makefile,v 1.5 2011/02/02 21:31:38 laffer1 Exp $

PORTNAME=	fcgi
PORTVERSION=	2.4.0
CATEGORIES=	www
MASTER_SITES=	http://www.fastcgi.com/dist/
PKGNAMESUFFIX=	-devkit

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FastCGI Development Kit
LICENSE=	other

USE_AUTOTOOLS=	libtool
USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes

MAN1=		cgi-fcgi.1
MAN3=		FCGI_Accept.3 FCGI_Finish.3 FCGI_SetExitStatus.3 \
		FCGI_StartFilterData.3

post-install:
.for y in ${MAN1}
	@${INSTALL_MAN} ${WRKSRC}/doc/${y} ${MANPREFIX}/man/man1
.endfor
.for x in ${MAN3}
	@${INSTALL_MAN} ${WRKSRC}/doc/${x} ${MANPREFIX}/man/man3
.endfor
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/*.htm* ${WRKSRC}/doc/*.gif \
		${DOCSDIR}
.for i in fastcgi-prog-guide fastcgi-whitepaper
	@${MKDIR} ${DOCSDIR}/${i}
	@${INSTALL_DATA} ${WRKSRC}/doc/${i}/* ${DOCSDIR}/$i
.endfor
.endif

.include <bsd.port.mk>

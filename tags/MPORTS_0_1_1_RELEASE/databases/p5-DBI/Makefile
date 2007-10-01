# New ports collection makefile for:	p5-DBI
# Date created:				October 17th 1996
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $MidnightBSD: mports/databases/p5-DBI/Makefile,v 1.3 2007/08/10 15:54:06 laffer1 Exp $
# $FreeBSD: ports/databases/p5-DBI/Makefile,v 1.63 2006/08/14 18:34:26 mat Exp $
#

PORTNAME=	DBI
PORTVERSION=	1.58
PORTREVISION=	1
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	DBI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The perl5 Database Interface.  Required for DBD::* modules
LICENSE=	perl

OPTIONS=	PROXY "Enable DBI::Proxy" Off

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Storable.pm:${PORTSDIR}/devel/p5-Storable
BUILD_DEPENDS=	${RUN_DEPENDS}

.if defined(WITH_PROXY)
RUN_DEPENDS+=	${SITE_PERL}/RPC/PlServer.pm:${PORTSDIR}/net/p5-PlRPC
.endif

CONFLICTS=	p5-DBI-1.3*
PERL_CONFIGURE=	yes

MAN1=		dbiprof.1 \
		dbiproxy.1
MAN3=		Bundle::DBI.3 \
		DBD::DBM.3 \
		DBD::File.3 \
		DBD::Proxy.3 \
		DBD::Sponge.3 \
		DBI.3 \
		DBI::Const::GetInfo::ANSI.3 \
		DBI::Const::GetInfo::ODBC.3 \
		DBI::Const::GetInfoReturn.3 \
		DBI::Const::GetInfoType.3 \
		DBI::DBD.3 \
		DBI::DBD::Metadata.3 \
		DBI::FAQ.3 \
		DBI::Profile.3 \
		DBI::ProfileData.3 \
		DBI::ProfileDumper.3 \
		DBI::ProfileDumper::Apache.3 \
		DBI::ProfileSubs.3 \
		DBI::ProxyServer.3 \
		DBI::PurePerl.3 \
		DBI::SQL::Nano.3 \
		DBI::W32ODBC.3 \
		Roadmap.3 \
		Win32::DBIODBC.3


.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README 

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>



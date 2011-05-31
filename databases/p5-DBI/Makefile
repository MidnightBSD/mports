# $MidnightBSD: mports/databases/p5-DBI/Makefile,v 1.9 2010/10/21 18:50:48 laffer1 Exp $
# $FreeBSD: ports/databases/p5-DBI/Makefile,v 1.63 2006/08/14 18:34:26 mat Exp $

PORTNAME=	DBI
PORTVERSION=	1.616
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The perl5 Database Interface.  Required for DBD::* modules
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Storable.pm:${PORTSDIR}/devel/p5-Storable
BUILD_DEPENDS=	${RUN_DEPENDS}

.if defined(WITH_PROXY)
RUN_DEPENDS+=	${SITE_PERL}/RPC/PlServer.pm:${PORTSDIR}/net/p5-PlRPC
.endif

CONFLICTS=	p5-DBI-1.3*
PERL_CONFIGURE=	yes

MAN1=		dbilogstrip.1 dbiprof.1 dbiproxy.1
MAN3=		Bundle::DBI.3 \
		DBD::DBM.3 \
		DBD::File.3 \
		DBD::File::Developers.3 \
		DBD::File::Roadmap.3 \
		DBD::Gofer.3 \
		DBD::Gofer::Policy::Base.3 \
		DBD::Gofer::Policy::classic.3 \
		DBD::Gofer::Policy::pedantic.3 \
		DBD::Gofer::Policy::rush.3 \
		DBD::Gofer::Transport::Base.3 \
		DBD::Gofer::Transport::null.3 \
		DBD::Gofer::Transport::pipeone.3 \
		DBD::Gofer::Transport::stream.3 \
		DBD::Proxy.3 \
		DBD::Sponge.3 \
		DBI.3 \
		DBI::Const::GetInfo::ANSI.3 \
		DBI::Const::GetInfo::ODBC.3 \
		DBI::Const::GetInfoReturn.3 \
		DBI::Const::GetInfoType.3 \
		DBI::DBD.3 \
		DBI::DBD::Metadata.3 \
		DBI::DBD::SqlEngine.3 \
		DBI::FAQ.3 \
		DBI::Gofer::Execute.3 \
		DBI::Gofer::Request.3 \
		DBI::Gofer::Response.3 \
		DBI::Gofer::Serializer::DataDumper.3 \
		DBI::Gofer::Serializer::Base.3 \
		DBI::Gofer::Serializer::Storable.3 \
		DBI::Gofer::Transport::Base.3 \
		DBI::Gofer::Transport::pipeone.3 \
		DBI::Gofer::Transport::stream.3 \
		DBI::Profile.3 \
		DBI::ProfileData.3 \
		DBI::ProfileDumper.3 \
		DBI::ProfileDumper::Apache.3 \
		DBI::ProfileSubs.3 \
		DBI::ProxyServer.3 \
		DBI::PurePerl.3 \
		DBI::SQL::Nano.3 \
		DBI::Util::CacheMemory.3 \
		DBI::W32ODBC.3 \
		Win32::DBIODBC.3

.if !defined(WITH_PROXY)
pre-everything::
	@${ECHO_CMD} "If you need DBI::Proxy, try to set WITH_PROXY."
	@${ECHO_CMD} ""
	@sleep 1
.endif

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>

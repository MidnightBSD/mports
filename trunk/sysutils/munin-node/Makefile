# $MidnightBSD$

PORTNAME=	munin
PORTVERSION=	${MUNIN_VERSION}
PORTREVISION=	1
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MUNIN_SITES}
PKGNAMESUFFIX=	-node

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node-specific part of Munin

LICENSE=	gpl2

BUILD_DEPENDS=	p5-Module-Build>=0:${PORTSDIR}/devel/p5-Module-Build \
		p5-DateTime-HiRes>=0:${PORTSDIR}/devel/p5-DateTime-HiRes \
		munin-common>=0:${PORTSDIR}/sysutils/munin-common \
		p5-Net-Server>=0:${PORTSDIR}/net/p5-Net-Server \
		bash:${PORTSDIR}/shells/bash
RUN_DEPENDS=	p5-Cache-Cache>=0:${PORTSDIR}/devel/p5-Cache-Cache \
		p5-DateTime-HiRes>=0:${PORTSDIR}/devel/p5-DateTime-HiRes \
		munin-common>=0:${PORTSDIR}/sysutils/munin-common \
		p5-Net-Server>=0:${PORTSDIR}/net/p5-Net-Server \
		p5-Net-CIDR>=0:${PORTSDIR}/net-mgmt/p5-Net-CIDR \
		bash:${PORTSDIR}/shells/bash

DISTINFO_FILE=	${MUNIN_DISTINFO}
EXTRA_PATCHES+=	${MUNIN_PATCHES}
USE_PERL5=	yes
USES=		gmake shebangfix
PKGMESSAGE=	${WRKDIR}/pkg-message
REINPLACE_ARGS=	-i ""
SHEBANG_FILES=	node/sbin/munin-node

.include "${.CURDIR}/../munin-common/munin.mk"

ALL_TARGET=	build-node build-plugins
INSTALL_TARGET=	install-node-prime install-plugins-prime

OPTIONS_DEFINE=	SNMP
OPTIONS_DEFAULT=	SNMP
SNMP_DESC=	Include support for SNMP plugins

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSNMP}
BUILD_DEPENDS+=	p5-Net-SNMP>=0:${PORTSDIR}/net-mgmt/p5-Net-SNMP
RUN_DEPENDS+=	p5-Net-SNMP>=0:${PORTSDIR}/net-mgmt/p5-Net-SNMP
.endif

MAN1=		munin-node-configure.1 \
		munin-node.1 \
		munin-run.1 \
		munin-sched.1 \
		munindoc.1
MAN3_NODE=	Munin::Node::Config.3 \
		Munin::Node::Configure::Debug.3 \
		Munin::Node::Configure::History.3 \
		Munin::Node::Configure::HostEnumeration.3 \
		Munin::Node::Configure::Plugin.3 \
		Munin::Node::Configure::PluginList.3 \
		Munin::Node::Logger.3 \
		Munin::Node::OS.3 \
		Munin::Node::ProxySpooler.3 \
		Munin::Node::SNMPConfig.3 \
		Munin::Node::Server.3 \
		Munin::Node::Service.3 \
		Munin::Node::Session.3 \
		Munin::Node::SpoolReader.3 \
		Munin::Node::SpoolWriter.3 \
		Munin::Node::Utils.3
MAN3_PLUGIN=	Munin::Plugin.3 \
		Munin::Plugin::Pgsql.3 \
		Munin::Plugin::SNMP.3
MAN3=		${MAN3_NODE} ${MAN3_PLUGIN}
MAN5=		munin-node.conf.5
MAN8=		munin.8

SUB_FILES=	pkg-message
USE_RC_SUBR=	munin-node munin-sched

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' \
		${WRKSRC}/node/sbin/munin-node \
		${WRKSRC}/node/sbin/munin-node-configure \
		${WRKSRC}/node/sbin/munin-run
	@${REINPLACE_CMD} \
		-e 's|^\(BASH[[:space:]]*:=\).*|\1 ${bash_CMD}|' \
		-e 's|^\(JAVARUN[[:space:]]*:=\).*|\1 ${java_CMD}|' \
		-e 's|^\(PERL[[:space:]]*:=\).*|\1 ${perl_CMD}|' \
		-e 's|^\(PYTHON[[:space:]]*:=\).*|\1 ${python_CMD}|' \
		-e 's|^\(RUBY[[:space:]]*:=\).*|\1 ${ruby_CMD}|' \
		${WRKSRC}/Makefile.config
	@${FIND} ${WRKSRC}/node/sbin -type f -name "*.orig" -delete
	${CP} -r ${WRKSRC}/plugins/node.d.freebsd ${WRKSRC}/plugins/node.d.midnightbsd

post-install:
	@${INSTALL_SCRIPT} ${WRKDIR}/munin-node \
		${PREFIX}/etc/rc.d/munin-node
	@${INSTALL_DATA} ${WRKSRC}/build/node/munin-node.conf \
		${ETCDIR}/munin-node.conf.sample
	@if [ ! -f ${ETCDIR}/munin-node.conf ]; then \
		${INSTALL_DATA} ${ETCDIR}/munin-node.conf.sample \
			${ETCDIR}/munin-node.conf; \
	fi
	@${INSTALL_DATA} ${FILESDIR}/plugins.conf \
		${ETCDIR}/plugin-conf.d/plugins.conf.sample
	@if [ ! -f ${ETCDIR}/plugin-conf.d/plugins.conf ]; then \
		${INSTALL_DATA} ${ETCDIR}/plugin-conf.d/plugins.conf.sample \
			${ETCDIR}/plugin-conf.d/plugins.conf; \
	fi
	@(cd ${WRKSRC}/node/blib/bindoc && for man in ${MAN1}; do \
		${INSTALL_MAN} -C $$man ${PREFIX}/man/man1; \
	done)
	@(cd ${WRKSRC}/node/blib/libdoc && for man in ${MAN3_NODE}; do \
		${INSTALL_MAN} -C $$man ${PREFIX}/man/man3; \
	done)
	@(cd ${WRKSRC}/plugins/blib/libdoc && for man in ${MAN3_PLUGIN}; do \
		${INSTALL_MAN} -C $$man ${PREFIX}/man/man3; \
	done)
	@(cd ${WRKSRC}/build/doc && for man in ${MAN5}; do \
		${INSTALL_MAN} -C $$man ${PREFIX}/man/man5; \
	done)
	@(cd ${WRKSRC}/build/doc && for man in ${MAN8}; do \
		${INSTALL_MAN} -C $$man ${PREFIX}/man/man8; \
	done)
	@${ECHO} ${PORTVERSION} > /tmp/.munin-node.version

	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
	        ${PREFIX}/share/munin/plugins/exim_mailqueue \
		${PREFIX}/share/munin/plugins/ifx_concurrent_sessions_ \
		${PREFIX}/share/munin/plugins/ipmi_sensor_ \
		${PREFIX}/share/munin/plugins/mysql_innodb \
		${PREFIX}/share/munin/plugins/mysql_isam_space_ \
		${PREFIX}/share/munin/plugins/mysql_threads \
		${PREFIX}/share/munin/plugins/named \
		${PREFIX}/share/munin/plugins/ntp_kernel_pll_freq \
		${PREFIX}/share/munin/plugins/postfix_mailstats \
		${PREFIX}/share/munin/plugins/psu_ \
		${PREFIX}/share/munin/plugins/squeezebox_ \
		${PREFIX}/share/munin/plugins/varnish_

.include <bsd.port.mk>

ccc
%% CCC
ccc
%% Make figure and change title
for tick = 1:100 % loop
    fig_idx = 1;
    fig = set_fig(figure(fig_idx),'pos',[0.5,0.5,0.3,0.45],...
        'view_info',[80,26],'axis_info',[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
        'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
        'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
    % Plot title
    title_str = sprintf('[%d] Figure $f(x) = \\exp(x)$',tick);
    plot_title(title_str,'fig_idx',fig_idx,...
        'tfs',35,'tfc','k','interpreter','latex');
    fprintf('%d\n',tick);
    drawnow; 
    if ~ishandle(fig), break; end
end % for tick = 1:100 % loop

%% Plot coordinates (Spatial Vector)

ccc
T_world = pr2t(cv([0,0,0]),rpy2r([0,0,0])); % world coordinate

max_tick = 1000;
v = [0, 0, 1, 0, 0, 1];
for tick = 1:max_tick % loop
    % Run
    % tick이 늘면서 rotation 진행
%     transLocal = rpy2r(tick*D2R*cv([1,0,0]))*[2; 0; 0;];
    transLocal = rpy2r(v(4:6))*[1;0;0];
    rotLocal = rpy2r(v(1:3));
    T_rot = pr2t(transLocal, rotLocal)
    % spatial
    r = [rotLocal zeros(3,3); zeros(3,3) rotLocal];
    t = [ones(3,3) -cross(r); zeros(3,3) ones(3,3)];
    transform = r*t;
    v = (transform*v')';
        
    T_local = T_rot*T_world;
    
    % Animate
    if mod(tick,5) == 0 % plot every 5 tick
        fig = set_fig(figure(1),'pos',[0.5,0.5,0.3,0.45],...
            'view_info',[80,26],'axis_info',5*[-1,+1,-1,+1,-1,+1],'AXIS_EQUAL',1,'GRID_ON',1,...
            'REMOVE_MENUBAR',1,'USE_DRAGZOOM',1,...
            'SET_CAMLIGHT',1,'SET_MATERIAL','METAL','SET_AXISLABEL',1,'afs',18);
        % Plot world coordinate
        plot_T(T_world,'fig_idx',1,'subfig_idx',1,...
            'PLOT_AXIS',1,'all',1.0,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','m','sfa',0.5,...
            'text_str','$~~\Sigma_W$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        % Plot local coordinate
        plot_T(T_local,'fig_idx',1,'subfig_idx',2,...
            'PLOT_AXIS',1,'all',0.3,'alc','','alw',2,'als','-',...
            'PLOT_AXIS_TIP',1,'atr',0.05,...
            'PLOT_SPHERE',1,'sr',0.05,'sfc','c','sfa',0.5,...
            'text_str','$~~\Sigma_a$','text_fs',20,'text_color','k','text_interp','latex',...
            'USE_ZOOMRATE',1);
        % Plot cube
        xyz_min = cv([0,0,0]);
        xyz_len = cv([0.5,0.5,0.5]);
        plot_cube(T_local,xyz_min,xyz_len,'fig_idx',1,'subfig_idx',1,...
            'bfc','b','bfa',0.3,'bec','k')
        % Plot a line from world coordinate to local coordinate
        p_world = t2p(T_world);
        p_local = t2p(T_local);
        plot_line(p_world,p_local,'fig_idx',1,'lc','k','lw',1);
        % Plot title
        title_str = sprintf('[%d/%d]',tick,max_tick);
        plot_title(title_str,'fig_idx',1,'tfs',25,'tfc','k','interpreter','latex');
        drawnow;
        if ~ishandle(fig), break; end
    end
end % for tick = 1:100 % loop

function c = cross(x)
    c = [0 -x(3) x(2); x(3) 0 -x(1); -x(2) x(1) 0];
end